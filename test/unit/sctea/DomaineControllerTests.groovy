package sctea



import org.junit.*
import grails.test.mixin.*

@TestFor(DomaineController)
@Mock(Domaine)
class DomaineControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/domaine/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.domaineInstanceList.size() == 0
        assert model.domaineInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.domaineInstance != null
    }

    void testSave() {
        controller.save()

        assert model.domaineInstance != null
        assert view == '/domaine/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/domaine/show/1'
        assert controller.flash.message != null
        assert Domaine.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/domaine/list'

        populateValidParams(params)
        def domaine = new Domaine(params)

        assert domaine.save() != null

        params.id = domaine.id

        def model = controller.show()

        assert model.domaineInstance == domaine
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/domaine/list'

        populateValidParams(params)
        def domaine = new Domaine(params)

        assert domaine.save() != null

        params.id = domaine.id

        def model = controller.edit()

        assert model.domaineInstance == domaine
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/domaine/list'

        response.reset()

        populateValidParams(params)
        def domaine = new Domaine(params)

        assert domaine.save() != null

        // test invalid parameters in update
        params.id = domaine.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/domaine/edit"
        assert model.domaineInstance != null

        domaine.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/domaine/show/$domaine.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        domaine.clearErrors()

        populateValidParams(params)
        params.id = domaine.id
        params.version = -1
        controller.update()

        assert view == "/domaine/edit"
        assert model.domaineInstance != null
        assert model.domaineInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/domaine/list'

        response.reset()

        populateValidParams(params)
        def domaine = new Domaine(params)

        assert domaine.save() != null
        assert Domaine.count() == 1

        params.id = domaine.id

        controller.delete()

        assert Domaine.count() == 0
        assert Domaine.get(domaine.id) == null
        assert response.redirectedUrl == '/domaine/list'
    }
}
