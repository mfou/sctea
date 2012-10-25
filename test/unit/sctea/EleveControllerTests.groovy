package sctea



import org.junit.*
import grails.test.mixin.*

@TestFor(EleveController)
@Mock(Eleve)
class EleveControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eleve/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eleveInstanceList.size() == 0
        assert model.eleveInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eleveInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eleveInstance != null
        assert view == '/eleve/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eleve/show/1'
        assert controller.flash.message != null
        assert Eleve.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eleve/list'

        populateValidParams(params)
        def eleve = new Eleve(params)

        assert eleve.save() != null

        params.id = eleve.id

        def model = controller.show()

        assert model.eleveInstance == eleve
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eleve/list'

        populateValidParams(params)
        def eleve = new Eleve(params)

        assert eleve.save() != null

        params.id = eleve.id

        def model = controller.edit()

        assert model.eleveInstance == eleve
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eleve/list'

        response.reset()

        populateValidParams(params)
        def eleve = new Eleve(params)

        assert eleve.save() != null

        // test invalid parameters in update
        params.id = eleve.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eleve/edit"
        assert model.eleveInstance != null

        eleve.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eleve/show/$eleve.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eleve.clearErrors()

        populateValidParams(params)
        params.id = eleve.id
        params.version = -1
        controller.update()

        assert view == "/eleve/edit"
        assert model.eleveInstance != null
        assert model.eleveInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eleve/list'

        response.reset()

        populateValidParams(params)
        def eleve = new Eleve(params)

        assert eleve.save() != null
        assert Eleve.count() == 1

        params.id = eleve.id

        controller.delete()

        assert Eleve.count() == 0
        assert Eleve.get(eleve.id) == null
        assert response.redirectedUrl == '/eleve/list'
    }
}
