package sctea



import org.junit.*
import grails.test.mixin.*

@TestFor(ClasseController)
@Mock(Classe)
class ClasseControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/classe/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.classeInstanceList.size() == 0
        assert model.classeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.classeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.classeInstance != null
        assert view == '/classe/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/classe/show/1'
        assert controller.flash.message != null
        assert Classe.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/classe/list'

        populateValidParams(params)
        def classe = new Classe(params)

        assert classe.save() != null

        params.id = classe.id

        def model = controller.show()

        assert model.classeInstance == classe
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/classe/list'

        populateValidParams(params)
        def classe = new Classe(params)

        assert classe.save() != null

        params.id = classe.id

        def model = controller.edit()

        assert model.classeInstance == classe
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/classe/list'

        response.reset()

        populateValidParams(params)
        def classe = new Classe(params)

        assert classe.save() != null

        // test invalid parameters in update
        params.id = classe.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/classe/edit"
        assert model.classeInstance != null

        classe.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/classe/show/$classe.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        classe.clearErrors()

        populateValidParams(params)
        params.id = classe.id
        params.version = -1
        controller.update()

        assert view == "/classe/edit"
        assert model.classeInstance != null
        assert model.classeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/classe/list'

        response.reset()

        populateValidParams(params)
        def classe = new Classe(params)

        assert classe.save() != null
        assert Classe.count() == 1

        params.id = classe.id

        controller.delete()

        assert Classe.count() == 0
        assert Classe.get(classe.id) == null
        assert response.redirectedUrl == '/classe/list'
    }
}
