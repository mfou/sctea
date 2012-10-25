package sctea



import org.junit.*
import grails.test.mixin.*

@TestFor(PeriodeController)
@Mock(Periode)
class PeriodeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/periode/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.periodeInstanceList.size() == 0
        assert model.periodeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.periodeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.periodeInstance != null
        assert view == '/periode/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/periode/show/1'
        assert controller.flash.message != null
        assert Periode.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/periode/list'

        populateValidParams(params)
        def periode = new Periode(params)

        assert periode.save() != null

        params.id = periode.id

        def model = controller.show()

        assert model.periodeInstance == periode
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/periode/list'

        populateValidParams(params)
        def periode = new Periode(params)

        assert periode.save() != null

        params.id = periode.id

        def model = controller.edit()

        assert model.periodeInstance == periode
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/periode/list'

        response.reset()

        populateValidParams(params)
        def periode = new Periode(params)

        assert periode.save() != null

        // test invalid parameters in update
        params.id = periode.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/periode/edit"
        assert model.periodeInstance != null

        periode.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/periode/show/$periode.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        periode.clearErrors()

        populateValidParams(params)
        params.id = periode.id
        params.version = -1
        controller.update()

        assert view == "/periode/edit"
        assert model.periodeInstance != null
        assert model.periodeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/periode/list'

        response.reset()

        populateValidParams(params)
        def periode = new Periode(params)

        assert periode.save() != null
        assert Periode.count() == 1

        params.id = periode.id

        controller.delete()

        assert Periode.count() == 0
        assert Periode.get(periode.id) == null
        assert response.redirectedUrl == '/periode/list'
    }
}
